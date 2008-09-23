From: Christopher Taylor <chtaylo3@gmail.com>
Date: Tue, 23 Sep 2008 13:29:26 -0400
Subject: [Buildroot] Buildroot with a custom kernel
In-Reply-To: <ea7358da0809230856u39726ed6k90c06c8cdbb8a2b@mail.gmail.com>
References: <ea7358da0809230856u39726ed6k90c06c8cdbb8a2b@mail.gmail.com>
Message-ID: <2590773a0809231029o75f55b61u58eb59f18d4421fd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Two options that I'm aware of:

1) start muckiung with the makefile's etc to get it to work
2) tarball up your custom kernel and place it in the dl dir.  Make
sure you name is according to what you have in your buildroot config
for the kernel version.  BR will then assume you've already dl'ed the
kernel and use your version.


HTH,
Chris

On Tue, Sep 23, 2008 at 11:56 AM, Alex Rades <alerades@gmail.com> wrote:
> Hi folks,
> I'm using today's svn version and I'd like to build with a custom
> 2.6.15 tree which i have here. I don't understand if this is possible
> or what do i have to modify in order to do it. The doc says basically
> it isn't possible but seems not completely up to date for this topic.
>
> Thank you
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
