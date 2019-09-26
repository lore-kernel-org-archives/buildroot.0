From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Sep 2019 11:31:24 +0200
Subject: [Buildroot] [PATCH-2019.02.x 1/1] package/mosquitto: security
 bump to v1.5.9
In-Reply-To: <20190920091037.4015-1-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Fri, 20 Sep 2019 11:10:37 +0200")
References: <20190920091037.4015-1-titouan.christophe@railnova.eu>
Message-ID: <87d0fn76ab.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > This is a backportport of c5c106e4e362b7c657cf322e82ce7102e29313a1 into 2019.02
 > If a client sends a SUBSCRIBE packet containing a topic that consists of
 > approximately 65400 or more '/' characters, i.e.  the topic hierarchy
 > separator, then a stack overflow will occur.

 > The issue is fixed in Mosquitto 1.6.6 and 1.5.9.  Patches for older versions
 > are available at https://mosquitto.org/files/cve/2019-hier

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
