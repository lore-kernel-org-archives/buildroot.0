From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Nov 2016 15:05:18 +0100
Subject: [Buildroot] [PATCH for-master] package/domoticz: disable for
 Sourcery CodeBench SH 2012.09
In-Reply-To: <1478864711-16038-1-git-send-email-romain.naour@gmail.com>
References: <1478864711-16038-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161111150518.17dec28c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Nov 2016 12:45:11 +0100, Romain Naour wrote:
> Like for prboom, domoticz trigger an internal compiler error:
> [...]/hardware/MySensorsBase.cpp: In member function 'void MySensorsBase::Do_Send_Work()':
> [...]/hardware/MySensorsBase.cpp:2190:6: internal compiler error: Segmentation fault
> 
> Fixes:
> http://autobuild.buildroot.net/results/0ea/0eadf342f86ed71c3a4008f13a4d3e175143460d
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/domoticz/Config.in | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
