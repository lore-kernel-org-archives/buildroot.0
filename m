From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 May 2020 22:58:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: fix bump to
 version 1.3.2
In-Reply-To: <20200422080751.4180403-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 22 Apr 2020 10:07:51 +0200")
References: <20200422080751.4180403-1-fontaine.fabrice@gmail.com>
Message-ID: <87blmzv4wy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit e69b8ddd43292b03b8f30f748ee2279b8df64c47 bumped paho-mqtt-c to
 > version 1.3.2 but hash was wrong moreover licence has changed to EPL-2.0
 > since
 > https://github.com/eclipse/paho.mqtt.c/commit/1e91229cb6403e3a9b02dfdc11c71b04c0518cff

 > So fix that and add LICENSE to the list of license files

 > Fixes:
 >  - http://autobuild.buildroot.org/results/7ea1791778053613e9ef6b146dbd1992a0f63dc6

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
