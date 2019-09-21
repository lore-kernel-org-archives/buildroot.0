From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 11:43:59 +0200
Subject: [Buildroot] Sanity check failed with expat package when
 modifying eigen.mk a
In-Reply-To: <AM0PR03MB38261EE54F381DDDC976EBEFDC890@AM0PR03MB3826.eurprd03.prod.outlook.com>
References: <AM0PR03MB38261EE54F381DDDC976EBEFDC890@AM0PR03MB3826.eurprd03.prod.outlook.com>
Message-ID: <9a9ed512-7222-05fd-d56f-062931ddd2fb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/09/2019 23:49, souileh bhn wrote:
> Hi,
> 
> I've made a change to the eigen.mk file as it is shown here
> (https://github.com/souilehbhn/buildroot_SLAM_Platform/commit/83f914093f9ae16e4bbb4c709a8fa3dc236b3cb2),
> but an error has occurred with the expat 2.2.6 package saying that cpp
> fails sanity check.
> 
> configure: error: C preprocessor
> "/home/~/buildroot_SLAM_Platform/output/host/bin/arm-linux-gnueabihf-cpp"
> fails sanity check
> 
> The buildroot is configured to use linaro toolchain for armhf. I've only
> checked mesa3d and eigen. if eigen is not checked the problem doesn't exist.
> 
> I can't find where is the problem exact.

 Is it possible that you changed something in your configuration and didn't do a
'make clean' before doing 'make'?

 Regards,
 Arnout
