From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Mar 2020 22:27:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/mongoose: security bump to
 version 6.17
In-Reply-To: <20200212212134.1573180-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 12 Feb 2020 22:21:34 +0100")
References: <20200212212134.1573180-1-fontaine.fabrice@gmail.com>
Message-ID: <87v9nah9aj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2019-19307: An integer overflow in parse_mqtt in mongoose.c in
 >   Cesanta Mongoose 6.16 allows an attacker to achieve remote DoS
 >   (infinite loop), or possibly cause an out-of-bounds write, by sending
 >   a crafted MQTT protocol packet.
 > - Update indentation of hash file (two spaces)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
