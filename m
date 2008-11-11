From: Jonathan Dumaresq <jdumaresq@cimeq.qc.ca>
Date: Tue, 11 Nov 2008 11:32:38 -0500
Subject: [Buildroot] where I should the change
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAABqQZ1l+jNtEvY6wPvHmCcUBAAAAAA==@cimeq.qc.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I would like to modify the config files that came with the netsnmp package.

I already have modified the files in my target_skeleton directory. 

But in the process, the target_skeleton is copied first and after the snmp
package install the conf file and override the one that have been previously
installed. 

I would to know what is best to do to not have my config file overritten ?

Modify the mk file to check if the conf file is already installed and if not
install the default conf file ?

Of there is a beter way of customize the skeleton directory ?

Jonathan
