From: Thomas Ruschival <t.ruschival@gmail.com>
Date: Sun, 11 Jan 2015 20:17:44 -0200
Subject: [Buildroot] Repository information during build
In-Reply-To: <XnsA41FE0AE5C843berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <CAAOPk_zdYo4RhifBpQq8mtBQmt4_xfmhm0rQw+ubZ9DOUDy1SQ@mail.gmail.com>
 <XnsA41FE0AE5C843berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <54B2F688.9010406@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,
thanks for the reply.

> TVHEADEND_VERSION = c051d0bda5b69ce61e64a97fd4a41db899dcfb53
> TVHEADEND_SITE=$(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))

In your example the version is already in the makefile. The source  is
retrieved by its SHA1.
What I wanted to do is to let the makefile always check out the master
branch. I don't like to update my buildroot makefiles if the master
branch changes its HEAD revision.

... maybe I have to rethink the integration strategy. But even if, I
really would like to have this feature....

Best regards
Thomas



On 01/11/2015 07:05 PM, Bernd Kuhls wrote:
> Thomas Ruschival <t.ruschival@gmail.com> wrote 
> in news:CAAOPk_zdYo4RhifBpQq8mtBQmt4_xfmhm0rQw+ubZ9DOUDy1SQ at mail.gmail.com:
> 
>> I.e. how do I find out the revision of the "master" branch Buildroot used
>> to create the tarball?
> 
> Hi,
> 
> an example: 
> http://git.buildroot.net/buildroot/tree/package/tvheadend/tvheadend.mk
> 
> You are looking for $(TVHEADEND_VERSION).
> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
