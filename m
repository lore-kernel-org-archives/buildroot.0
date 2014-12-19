From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 19 Dec 2014 15:59:54 +0000 (UTC)
Subject: [Buildroot] [Bug 7730] Error while connecting Qt Cretaor to device.
In-Reply-To: <bug-7730-163@https.bugs.busybox.net/>
References: <bug-7730-163@https.bugs.busybox.net/>
Message-ID: <20141219155954.042C680449@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7730

Sameer R <sam86eer@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |sam86eer at gmail.com
           Severity|major                       |critical

--- Comment #1 from Sameer R <sam86eer@gmail.com> 2014-12-19 15:59:53 UTC ---
Can any one help me with this issue please.

(In reply to comment #0)
> I have generated a image for the raspberry pi board using buildroot 2014.11,
> but while connecting Qt Creator via ssh to raspberry pi board it shows the
> following error.
> 
> Connecting to host...
> SSH connection failure: SSH Protocol error: Server and client capabilities
> don't match. Client list was: aes128-cbc,3des-cbc.
> Server list was
> aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm at openssh.com,aes256-gcm at openssh.com,chacha20-poly1305 at openssh.com.
> 
> Device test failed.
> 
> Whereas it is possible to connect the raspberry pi via terminal using ssh.
> Please help me with this issue.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
