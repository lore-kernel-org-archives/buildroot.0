From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 13 Aug 2018 09:35:17 -0500
Subject: [Buildroot] [PATCH] docs/manual: gcc 4.4 is the lowest we are
 known to work with
In-Reply-To: <e985bd73-96e5-a955-70fd-dfd532032a77@mentor.com>
References: <20180805114615.3442-1-yann.morin.1998@free.fr>
 <CANQCQpZv0zcAV4L_ZdRk21e22GLw5pzaTe_2JoH0kN_uC4Tumw@mail.gmail.com>
 <e985bd73-96e5-a955-70fd-dfd532032a77@mentor.com>
Message-ID: <CANQCQpbP3V91yxJynnWmuxkgG9JMbhOJQtWLqBe1mDokA_znQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,
On Thu, Aug 9, 2018 at 12:14 PM Hollis Blanchard
<hollis_blanchard@mentor.com> wrote:
>
> On 08/09/2018 06:08 AM, Matthew Weber wrote:
>
>
> Any suggestions if we keep the minimum host compiler requirement at
> 4.4, how should I address the below build failures with "error:
> '__ATOMIC_ACQUIRE' undeclared " on the RHEL6.5 autobuilder?
> http://autobuild.buildroot.net/?reason=host-libselinux-2.7
>

I've submitted this patch to require at least 4.7. I don't have a
target to test this.  Hollis, would you mind trying it on your RHEL
6.5?

http://patchwork.ozlabs.org/patch/957001/
