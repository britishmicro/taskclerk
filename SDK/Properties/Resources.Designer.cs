﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BritishMicro.TaskClerk.Properties {
    using System;
    
    
    /// <summary>
    ///   A strongly-typed resource class, for looking up localized strings, etc.
    /// </summary>
    // This class was auto-generated by the StronglyTypedResourceBuilder
    // class via a tool like ResGen or Visual Studio.
    // To add or remove a member, edit your .ResX file then rerun ResGen
    // with the /str option, or rebuild your VS project.
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("System.Resources.Tools.StronglyTypedResourceBuilder", "4.0.0.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    internal class Resources {
        
        private static global::System.Resources.ResourceManager resourceMan;
        
        private static global::System.Globalization.CultureInfo resourceCulture;
        
        [global::System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")]
        internal Resources() {
        }
        
        /// <summary>
        ///   Returns the cached ResourceManager instance used by this class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        internal static global::System.Resources.ResourceManager ResourceManager {
            get {
                if (object.ReferenceEquals(resourceMan, null)) {
                    global::System.Resources.ResourceManager temp = new global::System.Resources.ResourceManager("BritishMicro.TaskClerk.Properties.Resources", typeof(Resources).Assembly);
                    resourceMan = temp;
                }
                return resourceMan;
            }
        }
        
        /// <summary>
        ///   Overrides the current thread's CurrentUICulture property for all
        ///   resource lookups using this strongly typed resource class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        internal static global::System.Globalization.CultureInfo Culture {
            get {
                return resourceCulture;
            }
            set {
                resourceCulture = value;
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Task activity cannot be set to null..
        /// </summary>
        internal static string ActivityCannotBeSetToNull {
            get {
                return ResourceManager.GetString("ActivityCannotBeSetToNull", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The activity &apos;{0}&apos; was started @ {1:HH:mm} 
        ///on the {1:dd MMM yyyy}, 
        ///Running for {2:####.0} minutes.
        /// </summary>
        internal static string ActivitySummaryString {
            get {
                return ResourceManager.GetString("ActivitySummaryString", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Event type activities cannot be merged..
        /// </summary>
        internal static string CannotMergeEvents {
            get {
                return ResourceManager.GetString("CannotMergeEvents", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to This CompareTo method expects type [TaskActivity].
        /// </summary>
        internal static string CompareToTypeError {
            get {
                return ResourceManager.GetString("CompareToTypeError", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The TaskClerk configuration file is invalid..
        /// </summary>
        internal static string ConfigurationFileInvalid {
            get {
                return ResourceManager.GetString("ConfigurationFileInvalid", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to TaskClerk requires a valid configuration file. You may need to reinstall the application..
        /// </summary>
        internal static string ConfigurationFileIsInvalid {
            get {
                return ResourceManager.GetString("ConfigurationFileIsInvalid", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to &lt;?xml version=&quot;1.0&quot;?&gt;
        ///&lt;License key=&quot;&quot;&gt;
        ///&lt;Owner type=&quot;Person&quot; name=&quot;Anonymous&quot; email=&quot;&quot; /&gt;
        ///&lt;Application name=&quot;TaskClerk&quot; version=&quot;1&quot;&gt;
        ///&lt;Capabilities&gt;
        ///&lt;WindowSize type=&quot;Period&quot; unit=&quot;days&quot; value=&quot;35&quot; /&gt;	
        ///&lt;/Capabilities&gt;
        ///&lt;/Application&gt;
        ///&lt;/License&gt;.
        /// </summary>
        internal static string DefaultLicense {
            get {
                return ResourceManager.GetString("DefaultLicense", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to &lt;?xml version=&quot;1.0&quot;?&gt;
        ///&lt;ArrayOfTaskDescription xmlns:xsi=&quot;http://www.w3.org/2001/XMLSchema-instance&quot; xmlns:xsd=&quot;http://www.w3.org/2001/XMLSchema&quot;&gt;
        ///  &lt;TaskDescription&gt;
        ///    &lt;Id&gt;136f6c6f-ef59-4568-ad07-a7fa1120b7ca&lt;/Id&gt;
        ///    &lt;Name&gt;Default&lt;/Name&gt;
        ///    &lt;Description&gt;Not for general use.&lt;/Description&gt;
        ///    &lt;NoNagMinutes&gt;1&lt;/NoNagMinutes&gt;
        ///    &lt;Colour&gt;NAME:Black&lt;/Colour&gt;
        ///    &lt;CustomFlags&gt;0&lt;/CustomFlags&gt;
        ///    &lt;IsPrivate&gt;false&lt;/IsPrivate&gt;
        ///    &lt;MenuColumn&gt;0&lt;/MenuColumn&gt;
        ///    &lt;Sequence&gt;0&lt;/Sequence&gt;
        ///    &lt;IsEvent&gt;fal [rest of string was truncated]&quot;;.
        /// </summary>
        internal static string DefaultTaskDescriptions {
            get {
                return ResourceManager.GetString("DefaultTaskDescriptions", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Task description cannot be set to null..
        /// </summary>
        internal static string DescriptionCannotBeSetToNull {
            get {
                return ResourceManager.GetString("DescriptionCannotBeSetToNull", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The event &apos;{0}&apos; occurred @ {1:HH:mm} on the {1:dd MMM yyyy}.
        /// </summary>
        internal static string EventSummaryString {
            get {
                return ResourceManager.GetString("EventSummaryString", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to 60000.
        /// </summary>
        internal static string HeartbeatInterval {
            get {
                return ResourceManager.GetString("HeartbeatInterval", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to TaskClerk could not establish your identity, IdentityProvider code problem..
        /// </summary>
        internal static string IdentityCouldNotBeEstablished {
            get {
                return ResourceManager.GetString("IdentityCouldNotBeEstablished", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The Exporter is in an Invalid state..
        /// </summary>
        internal static string InvalidExporterState {
            get {
                return ResourceManager.GetString("InvalidExporterState", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to No providers found in configuration file.
        /// </summary>
        internal static string NoProvidersFoundInConfigurationFile {
            get {
                return ResourceManager.GetString("NoProvidersFoundInConfigurationFile", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to role cannot be set to null..
        /// </summary>
        internal static string RoleCannotBeSetToNull {
            get {
                return ResourceManager.GetString("RoleCannotBeSetToNull", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to TaskClerk.
        /// </summary>
        internal static string SdkName {
            get {
                return ResourceManager.GetString("SdkName", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The container cannot be null..
        /// </summary>
        internal static string TheContainerCannotBeNull {
            get {
                return ResourceManager.GetString("TheContainerCannotBeNull", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to (?&lt;TypeName&gt;[^,]+)[\s]*[,][\s]*(?&lt;AssemblyName&gt;\S+).*$.
        /// </summary>
        internal static string TypeNameAndAssemblyRegEx {
            get {
                return ResourceManager.GetString("TypeNameAndAssemblyRegEx", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Unable to find {0} in the configuration file..
        /// </summary>
        internal static string UnableToFindConfigurationFile {
            get {
                return ResourceManager.GetString("UnableToFindConfigurationFile", resourceCulture);
            }
        }
    }
}
