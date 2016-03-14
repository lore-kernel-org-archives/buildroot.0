From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Mar 2016 12:00:54 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-03-13
In-Reply-To: <56E69644.4030002@lucaceresoli.net>
References: <20160314073023.29F5C1012C1@stock.ovh.net>
 <56E69644.4030002@lucaceresoli.net>
Message-ID: <20160314120054.45e1983c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca,

On Mon, 14 Mar 2016 11:45:24 +0100, Luca Ceresoli wrote:
> Hi,
> 
> On 14/03/2016 08:30, Thomas Petazzoni wrote:
> [...]
> >          arm |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/e5c85272b5561549dfc478264ee6507bb9ad8c9f/
> 
> Musl toolchain, and as Thomas already pointed out libpjsip does not
> build with it.
> 
> Patches to fix this issue are almost ready here. But it might need a
> little extra time before I can send them to Buildroot because the pjsip
> project requires Copyright Assignment, with associated paperwork... :|

Two options:

 1/ You submit your patches to Buildroot before doing the copyright
    assignment. From a Buildroot point of view, it is sufficient if
    your patches are licensed under the publicly available license of
    pjsip. Of course, if they later get merged upstream after doing the
    copyright assignment, it is better, but that doesn't prevent from
    submitting the patches to Buildroot IMO.

 2/ You submit a patch that disables pjsip on musl for the moment, and
    you can re-enable it once the patches have been accepted upstream.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
