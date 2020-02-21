From: Gervais, Francois <FGervais@distech-controls.com>
Date: Fri, 21 Feb 2020 22:00:25 +0000
Subject: [Buildroot] [v5,
 4/9] package/qoriq-rcw: add target rcw binary support
Message-ID: <DM6PR01MB5849DB1F91ABFC7663CCDACCF3120@DM6PR01MB5849.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerry,

I'm not sure if "Custom RCW" is the right menu name for
BR2_PACKAGE_HOST_QORIQ_RCW_BIN.

To me, BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH is the custom
rcw as it is provided by the user. 

I feel BR2_PACKAGE_HOST_QORIQ_RCW_BIN is the opposite of
custom actually as it builds a manufacturer provided RCW file.

What do you think?

Also should it really depends on "!BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH"?
What prevents a user from building 2 RCWs for some reason, 1 user provided
and 1 officially provided through qoriq-rcw-LSDK-19.09.tar.gz?
