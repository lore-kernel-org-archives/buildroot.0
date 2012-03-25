From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 25 Mar 2012 22:29:44 +0200
Subject: [Buildroot] [PATCH 2/2] Add bluez package.
In-Reply-To: <CAAfyv35GO71OPa_JhuED+zSgSv+UOjZT258ipPXm-z7VDPnxRw@mail.gmail.com>
References: <1332463895-18574-1-git-send-email-marek.belisko@open-nandra.com>
 <CAGm1_ktDHM+7Z3TPJOWqi6qXKO15KNnzgFQH6=e-c4+qDUhmqw@mail.gmail.com>
 <CAAfyv35GO71OPa_JhuED+zSgSv+UOjZT258ipPXm-z7VDPnxRw@mail.gmail.com>
Message-ID: <201203252229.44415.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 23 March 2012 09:28:37 Belisko Marek wrote:
> On Fri, Mar 23, 2012 at 8:57 AM, Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
> > We already have bluez package. package/bluez_utils/bluez_utils.mk and
> > libbluetooth will be installed in staging. Am I missing something?
> If wanna use just library you can save some space to not compile whole utils.

 But your not doing that AFAICS.  You're using exactly the same source tar
as bluez_utils, and you don't have any config option to disable the utils.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
