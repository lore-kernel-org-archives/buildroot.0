From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Mar 2009 08:50:49 +0100
Subject: [Buildroot] Changing the selection of kernel in buildroot
In-Reply-To: <COL104-W83AF8BEBACE3D5C6708B29EE9B0@phx.gbl> (T. Y. Lai's
	message of "Mon\, 16 Mar 2009 15\:44\:21 +0800")
References: <COL104-W83AF8BEBACE3D5C6708B29EE9B0@phx.gbl>
Message-ID: <87ab7lrjmu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "T" == T Y Lai <d_unno@hotmail.com> writes:

 T> Hi,
 T> Is there a method the default kernel selection that is found in buildroot?

 T> The reason for doing so is due to the reason that I'm looking for?

 T> kernel 2.6.20.13
 T> and gcc 3.4.6

Why do you want to use so ancient versions? The 2009.02 release has
gcc 3.4.6 and 26.20.20 (when you enable build options -> show packages
that are deprecated), but they are removed from svn trunk.

-- 
Bye, Peter Korsgaard
