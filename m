From: Chrissy <c.pfindel@googlemail.com>
Date: Mon, 07 Dec 2009 14:20:36 +0100
Subject: [Buildroot] Problem configuring dbus-glib
In-Reply-To: <877hszqksf.fsf@macbook.be.48ers.dk>
References: <4B1C39E5.4020402@googlemail.com>
	<877hszqksf.fsf@macbook.be.48ers.dk>
Message-ID: <4B1D0124.5060604@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Peter Korsgaard schrieb:
>>>>>> "Chrissy" == Chrissy  <c.pfindel@googlemail.com> writes:
> 
>  Chrissy> Hi,
>  Chrissy> while configuring dbus-glib I get the following error:
> 
> 
>  >>>> dbus-glib 0.80 Configuring
> 
>  Chrissy> checking for XML_ParserCreate_MM in -lexpat... (cached) no
>  Chrissy> configure: error: expat library not found, check config.log for failed
>  Chrissy> attempts
> 
>  Chrissy> I'm using the stable buildroot-2009.11.
>  Chrissy> The XML_ParserCreate_MM can be found in the staging/usr/lib/libexpat.so.
>  Chrissy> So does anybody know how to solve this?
> 
> Notice the (cached) part. This means that your configure cache somehow
> lists expat as not being available. A quick fix is to run "make flush",
> but please send your .config to the list and I'll try to figure out what
> package needs to be fixed.
> 
> Is this with a clean rebuild or have you first built something and then
> afterwards added dbus-glib without running make clean in between?
> 
oops, forgot the .config
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: .config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091207/85a9cd54/attachment.diff>
