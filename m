From: thomas <thomas.spitz@gmail.com>
Date: Thu, 25 Apr 2013 12:41:34 -0700 (PDT)
Subject: [Buildroot] Dropbear/SFTP
In-Reply-To: <20130108130618.4991dff7@skate>
References: <002401cded96$e8b13fa0$ba13bee0$@co.uk>
 <20130108130618.4991dff7@skate>
Message-ID: <1366918894609-44233.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

I am in the same case as Ted Wood that is to say I can login using ssh from
a console ("ssh root at 192.168.1.5") however I am not able to connect to SFTP
server:("sftp root at 192.168.1.5" asks for a password but I got the following
error : sh: /usr/libexec/sftp-server: not found
Connection closed)

I am not using dropbear anymore (as it doesn't implement sftp) and enabled
openssh only. I would also want to use Buildroot/Eclipse integration (sounds
perfect) but I don't know which file the patch described here
"https://github.com/mbats/eclipse-buildroot-toolchain-plugin/blob/master/buildroot.patches/Integration-with-Buildroot-Toolchain-Eclipse-plugin.patch"
should apply to? Moreover I have a buildroot 201204 instead 201211 as
recommanded for the patch.

Hope you could help me

Best regards,
Thomas




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Dropbear-SFTP-tp38207p44233.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
