From: Kaiwan Billimoria <kaiwan.billimoria@gmail.com>
Date: Fri, 28 Dec 2012 18:41:45 +0530
Subject: [Buildroot] Setting up Perf for buildroot
In-Reply-To: <CAPDLWs-tb5qydSKCRCAS1Zg6605_ZhmQn=fA6daVxgUm3tT2rw@mail.gmail.com>
References: <CAPDLWs_Y9e_ecsk=U-PteDfFA=B8t9krpc8CM5ZzAYJ2uwH-hQ@mail.gmail.com>
 <45ecb208-6863-4266-9091-ec981005978b@zimbra2.corp.accelance.fr>
 <20121228115156.2f91b588@skate>
 <CAPDLWs-tb5qydSKCRCAS1Zg6605_ZhmQn=fA6daVxgUm3tT2rw@mail.gmail.com>
Message-ID: <CAPDLWs9-NaW=ycWKJnni-Gs2KFA5NgMAX4g0a5OPey_pX+oBYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Or, perhaps better:

BR2_LINUX_KERNEL_USERMODE_TOOLS_XXX

On Fri, Dec 28, 2012 at 6:39 PM, Kaiwan Billimoria
<kaiwan.billimoria@gmail.com> wrote:
> So I was thinking, keep a config directive in linux/Config.in called
> BR2_LINUX_KERNEL_TOOLS_XXX
> where XXX is the user-mode tool to be built.
