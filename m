From: Cyril HAENEL <chaenel@free.fr>
Date: Fri, 18 Dec 2009 20:30:25 +0100
Subject: [Buildroot] Strange behavior with shell redirection
In-Reply-To: <20091218190354.5302ccfe@surf>
References: <4B2B7141.90804@free.fr> <20091218190354.5302ccfe@surf>
Message-ID: <4B2BD851.1000902@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> In the default Buildroot target skeleton, /var/log is a symbolic link
> to /tmp, and /tmp is mounted as a tmpfs (the contents of the filesystem
> are stored into memory).
>
> So with the default Buildroot configuration, the contents of /var/log
> (and many other /var directories) are lost when you reboot.
>
> Cheers,
>
> Thomas
>   
Yesss ! Thank, It is the problem ! Thus it's a big problem because what 
will be the result when the memory will be full !?

Regards,
Cyril

-- 

Cyril Haenel
Registered Linux User #332632
