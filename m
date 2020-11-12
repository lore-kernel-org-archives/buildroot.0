From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Nov 2020 21:57:07 +0100
Subject: [Buildroot] [PATCH] package/apparmor: fix permission bits for
 apparmor.service
In-Reply-To: <46b899ee9f607f3d03a2881b83d355751cc07f64.1605212315.git.stefan@agner.ch>
 (Stefan Agner's message of "Thu, 12 Nov 2020 21:21:34 +0100")
References: <46b899ee9f607f3d03a2881b83d355751cc07f64.1605212315.git.stefan@agner.ch>
Message-ID: <875z6ajnto.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stefan" == Stefan Agner <stefan@agner.ch> writes:

 > Avoid setting executable bits for apparmor.service. This gets rid of a
 > corresponding warning during installation:
 >   Configuration file ../target/usr/lib/systemd/system/apparmor.service
 >   is marked executable. Please remove executable permission bits.
 >   Proceeding anyway.

 > Signed-off-by: Stefan Agner <stefan@agner.ch>

Committed, thanks.

-- 
Bye, Peter Korsgaard
