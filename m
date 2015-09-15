From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Sep 2015 22:35:03 +0200
Subject: [Buildroot] [PATCH v3 1/1] docs/website: contribute.txt update
 with useful tips on patch versioning and patch submission
In-Reply-To: <CAHkwnC_ZSEETW19H-4tKNcpr3z7XGn7Fu9iuCi4kbMROjgGQtg@mail.gmail.com>
References: <1441726084-15422-1-git-send-email-francesco.nwokeka@gmail.com>
 <1441727239-17284-1-git-send-email-francesco.nwokeka@gmail.com>
 <CAHkwnC_ZSEETW19H-4tKNcpr3z7XGn7Fu9iuCi4kbMROjgGQtg@mail.gmail.com>
Message-ID: <55F880F7.1090700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15-09-15 16:03, Fabio Porcedda wrote:
> On Tue, Sep 8, 2015 at 5:47 PM, Francesco Nwokeka <francesco.nwokeka@gmail.com
> <mailto:francesco.nwokeka@gmail.com>> wrote:
[snip]
>     +You can also add the +--in-reply-to <message-id>+ flag when
>     +submitting a patch to the mailing list. The id of the mail
>     +to reply to can be found under the "Message Id" tag on
>     +http://patchwork.buildroot.org[patchwork].
>     +The advantage of *in-reply-to* is that patchwork will automatically mark the
>     +previous patch as superseded.
>     +
> 
> 
> I've sent the "[PATCH v2] barebox: bump to version
> 2015.09.0"(http://lists.busybox.net/pipermail/buildroot/2015-September/139495.html)
> using the --in-reply-to option of format-patch, but patchwork didn't make the v1
> as superseded, I've done something wrong?
> 
> v2: http://patchwork.ozlabs.org/patch/517503/
> v1: http://patchwork.ozlabs.org/patch/517494/

 Weird, that normally should work, I've checked the headers and they look OK...
Patchwork isn't perfect about making the link but with in-reply-to I've not seen
it go wrong yet.

 I've now manually marked the v1 as superseded.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
