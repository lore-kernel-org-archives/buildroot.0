From: Jonathan Dumaresq <jdumaresq@cimeq.qc.ca>
Date: Tue, 11 Nov 2008 14:47:14 -0500
Subject: [Buildroot] where I should the change
In-Reply-To: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAABqQZ1l+jNtEvY6wPvHmCcUBAAAAAA==@cimeq.qc.ca>
References: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAABqQZ1l+jNtEvY6wPvHmCcUBAAAAAA==@cimeq.qc.ca>
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAJiLL0todwJEj+luLMNyOx4BAAAAAA==@cimeq.qc.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I would like to know if this patch is acceptable to solve the override of
the conf file ?

Jonathan

-----Message d'origine-----
De?: buildroot-bounces at uclibc.org [mailto:buildroot-bounces at uclibc.org] De
la part de Jonathan Dumaresq
Envoy??: 11 novembre 2008 11:33
??: buildroot at uclibc.org
Objet?: [Buildroot] where I should the change

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

_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot

-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: netsnmp.mk-test_if_conf_and_script_exists_before_installing_them.patch
Type: application/octet-stream
Size: 1417 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20081111/8054a716/attachment.obj 
