From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 18 Sep 2018 10:12:46 +0200
Subject: [Buildroot] [PATCH v2] qt5location: fix build failure due to
 missing qt5base gui dependency
In-Reply-To: <87lg8e75xm.fsf@dell.be.48ers.dk>
References: <20180905090307.89484-1-giulio.benetti@micronovasrl.com>
 <87lg8e75xm.fsf@dell.be.48ers.dk>
Message-ID: <724f4376-bc21-6900-805e-b6eca7975c5e@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 06/09/2018 21:59, Peter Korsgaard ha scritto:
>>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:
> 
>   > qt5location fails to build due to missing Qt5 Gui module.
>   > In configure.json features.opengl is referred, but it is available only
>   > if qt5base gui submodule is built.
> 
>   > Add BR2_PACKAGE_QT5BASE_GUI to qt5location Config.in to assure gui
>   > submodule is built before qt5location.
> 
>   > Fixes:
>   > http://autobuild.buildroot.org/results/1e1/1e12a819750c677c9ef204a324c8bf06212e5135/
>   > http://autobuild.buildroot.org/results/223/223ec6565beba1ca73d4ff488296feec53656b40/
>   > http://autobuild.buildroot.org/results/84f/84fe1c84e3537167ee3791e83c9fe2cc2805ccb5/
>   > http://autobuild.buildroot.org/results/9c9/9c96d2106222e623a379f9995bd059725eb27769/
>   > http://autobuild.buildroot.org/results/fa0/fa01513d28d896ca8819966c5b1ed5c35283e92f/
>   > http://autobuild.buildroot.org/results/5d7/5d7333470c31b83c697218382dc77f74af86c666/
>   > http://autobuild.buildroot.org/results/db7/db7b4c61bb41d32e0f7960c194588cd1559ff3f7/
>   > http://autobuild.buildroot.org/results/2b7/2b71f186b8d67c4805393c9c016d641893d46220/
>   > http://autobuild.buildroot.org/results/1e1/1e12a819750c677c9ef204a324c8bf06212e5135/
> 
>   > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>   > ---
>   > Changes V1->V2:
>   > * add missing Fixes: list in commit log
> 
> Committed, thanks.
> 

This patch fixes bug in 2018.05.x too:
http://autobuild.buildroot.net/results/eb1c30086e749d74af6538306026b1c2a1b139e3/

Do I need to resubmit it with commit log corrected under "Fixes:" ?
Or is it enough I've pointed it out?

Thanks
Kind regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
