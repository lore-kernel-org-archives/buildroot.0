From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 14 Mar 2016 11:45:24 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-03-13
In-Reply-To: <20160314073023.29F5C1012C1@stock.ovh.net>
References: <20160314073023.29F5C1012C1@stock.ovh.net>
Message-ID: <56E69644.4030002@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 14/03/2016 08:30, Thomas Petazzoni wrote:
[...]
>          arm |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/e5c85272b5561549dfc478264ee6507bb9ad8c9f/

Musl toolchain, and as Thomas already pointed out libpjsip does not
build with it.

Patches to fix this issue are almost ready here. But it might need a
little extra time before I can send them to Buildroot because the pjsip
project requires Copyright Assignment, with associated paperwork... :|

-- 
Luca
