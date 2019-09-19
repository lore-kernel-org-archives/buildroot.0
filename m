From: souileh bhn <slhbhn@hotmail.com>
Date: Thu, 19 Sep 2019 21:49:52 +0000
Subject: [Buildroot] Sanity check failed with expat package when modifying
 eigen.mk a
Message-ID: <AM0PR03MB38261EE54F381DDDC976EBEFDC890@AM0PR03MB3826.eurprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've made a change to the eigen.mk file as it is shown here
(https://github.com/souilehbhn/buildroot_SLAM_Platform/commit/83f914093f9ae16e4bbb4c709a8fa3dc236b3cb2),
but an error has occurred with the expat 2.2.6 package saying that cpp
fails sanity check.

configure: error: C preprocessor
"/home/~/buildroot_SLAM_Platform/output/host/bin/arm-linux-gnueabihf-cpp"
fails sanity check

The buildroot is configured to use linaro toolchain for armhf. I've only
checked mesa3d and eigen. if eigen is not checked the problem doesn't exist.

I can't find where is the problem exact.
