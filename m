From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Jan 2008 16:09:01 +0100
Subject: [Buildroot] svn co fail
In-Reply-To: <BLU129-W38D62D19E342BC34187BCFB5380@phx.gbl> (Tuvia K.'s message
	of "Thu\, 24 Jan 2008 16\:30\:22 +0200")
References: <BLU129-W38D62D19E342BC34187BCFB5380@phx.gbl>
Message-ID: <87myqvclbm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Tuvia" == Tuvia K <tuvia41@hotmail.com> writes:

 Tuvia> I also have the same problem.
 Tuvia> svn: Can't connect to host 'uclibc.org': Connection timed out

 Tuvia> But  checkout of another project like : svn co http://anonsvn.wireshark.org/wireshark/trunk/ wireshark
                                                       ^^^^^

svn-over-http (webdav) is not the same as the native svn protocol.

You most likely have port 3690 (svn) blocked in the firewall.

-- 
Bye, Peter Korsgaard
