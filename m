From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed, 6 Dec 2017 22:59:02 +0100
Subject: [Buildroot] [PATCH 0/5] New infrastructure for golang packages
In-Reply-To: <c95b3881-69a4-6cef-0bad-bb0a2c94fa69@mind.be>
References: <1512557817-431-1-git-send-email-angelo@amarulasolutions.com>
 <c95b3881-69a4-6cef-0bad-bb0a2c94fa69@mind.be>
Message-ID: <CA+_SqVappjdtOmpAWoLUquGJ-fVbUaz0LN-uiPLSJGqGu5vHLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

Il 06 dic 2017 10:39 PM, "Arnout Vandecappelle" <arnout@mind.be> ha scritto:

 Hi Angelo,

 I unfortunately probably won't have time to look at your patches tonight,
however:

On 06-12-17 11:56, Angelo Compagnucci wrote:
> This series add a new pkg-golang infrastructure and converts some of the
> packages based on go.
> I'll resend as an official patch series after receiving some comments in
> RFC trying to reignite the discussion.

 Is there any difference with v5?


No differences, I just sent this patch series as anon RFC cause I think
it's in shape to be accepted.

There doesn't seem to be a patch revision log
in any of the patches...


Right, not good. I'll do in this series if needed.

Thanks!


 Regards,
 Arnout

>
> Angelo Compagnucci (5):
>   package/pkg-golang: new package infrastructure
>   docs/manual: adding documentation for the golang infrastructure
>   package/flannel: converting to golang infrastructure
>   package/runc: converting to golang infrastructure
>   package/docker-containerd: converting to golang infrastructure
>
>  docs/manual/adding-packages-golang.txt         | 114
+++++++++++++++++++++++
>  docs/manual/adding-packages.txt                |   2 +
>  package/Makefile.in                            |   1 +
>  package/docker-containerd/docker-containerd.mk |  37 +++-----
>  package/flannel/flannel.mk                     |  32 +------
>  package/pkg-golang.mk                          | 121
+++++++++++++++++++++++++
>  package/runc/runc.mk                           |  37 +-------
>  7 files changed, 262 insertions(+), 82 deletions(-)
>  create mode 100644 docs/manual/adding-packages-golang.txt
>  create mode 100644 package/pkg-golang.mk
>

--
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171206/8ff0f6f2/attachment.html>
