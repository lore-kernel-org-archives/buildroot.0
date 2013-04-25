From: thomas <thomas.spitz@gmail.com>
Date: Thu, 25 Apr 2013 12:51:22 -0700 (PDT)
Subject: [Buildroot] Dropbear/SFTP
In-Reply-To: <87ip3a9yzi.fsf@dell.be.48ers.dk>
References: <002401cded96$e8b13fa0$ba13bee0$@co.uk>
 <20130108130618.4991dff7@skate> <1366918894609-44233.post@n4.nabble.com>
 <87ip3a9yzi.fsf@dell.be.48ers.dk>
Message-ID: <1366919482310-44235.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

As I wrote, I'm not using dropbear anymore but openssh alone.

Here below my simple test:
thomas at thomas-laptop:~/Armadeus/armadeus-5.2$ sftp root at 192.168.1.5
root at 192.168.1.5's password: 
sh: /usr/libexec/sftp-server: not found
Connection closed

Effectively, I have no /usr/libexec/sftp-server folder on my target. Openssh
didn't create it... Is there something manual to do in order to activate
sftp?

Thanks for your quick reply

Best regards,
Thomas




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Dropbear-SFTP-tp38207p44235.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
