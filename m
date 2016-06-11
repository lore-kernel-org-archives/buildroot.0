From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 16:41:50 +0200
Subject: [Buildroot] [PATCH v6] domoticz: new package
In-Reply-To: <6849_1463657718_573DA4F6_6849_12052_1_3ce00ece-243f-4019-b40a-3f70debf34ba@OPEXCLILM5F.corporate.adroot.infra.ftgroup>
References: <6849_1463657718_573DA4F6_6849_12052_1_3ce00ece-243f-4019-b40a-3f70debf34ba@OPEXCLILM5F.corporate.adroot.infra.ftgroup>
Message-ID: <20160611164150.17a91f7b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 May 2016 13:35:10 +0200, fabrice.fontaine at orange.com wrote:
> Domoticz is a Home Automation System that lets you monitor and
> configure various devices like: Lights, Switches, various
> sensors/meters like Temperature, Rain, Wind, UV, Electra, Gas, Water
> and much more. Notifications/Alerts can be sent to any mobile device.
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> ---
> Changes v5 -> v6 (after review of Julien Boibessot):
>  - Fix typo andi -> and in Config.in
>  - Fix port number from 18080 -> 8080 in S99domoticz

Applied to master with a few minor tweaks. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
