using System;
using System.Threading;
using System.Net;
using Mono.Nat;

namespace PFTools {
	class MakePortForwardings {
		private static ManualResetEvent manualResetEvent = new ManualResetEvent(false);
		public static void Main() {
			NatUtility.DeviceFound += HandleDeviceFound;
			NatUtility.StartDiscovery ();
			manualResetEvent.WaitOne (); 
		}
	
		protected static void HandleDeviceFound (object sender, DeviceEventArgs args) {
			foreach (Mapping mapping in args.Device.GetAllMappings ())
				Console.WriteLine (mapping.ToString ());
			manualResetEvent.Set (); 
		} 
	}
}
