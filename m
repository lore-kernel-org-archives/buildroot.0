From: Bassem Fahmy <t_fahmy_bassem@hotmail.com>
Date: Sun, 2 Sep 2018 10:09:22 +0000
Subject: [Buildroot] Including example applications to target
In-Reply-To: <87tvn849za.fsf@dell.be.48ers.dk>
References: <SYCPR01MB344072FCAF83E300F7033CC0CB0D0@SYCPR01MB3440.ausprd01.prod.outlook.com>,
 <87tvn849za.fsf@dell.be.48ers.dk>
Message-ID: <SYCPR01MB3440F757740F1CD405B561EECB0D0@SYCPR01MB3440.ausprd01.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>You probably want to make installing the example conditional on a sub
>option (like E.G. BR2_PACKAGE_QT_EXAMPLES), so the first option sounds
>simplest.

Thanks for the reply.
Following on this I have another question. The sample applications are  built in the  aws build folder (buildroot/output/build/aws-iot-device-sdk-cpp-master/buildroot-build/bin). How should I reference this?
Is it ok to reference buildroot-build directly or is there a variable that references it.

cp -dpfr $(@D)/buildroot-build/bin/* $(TARGET_DIR)/aws-iot-device-sdk-cpp

>--
>Bye, Peter Korsgaard

Regards,
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180902/356b0b9f/attachment.html>
