From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Feb 2020 14:52:45 +0100
Subject: [Buildroot] [PATCH v3 5/8] package/mariadb: rename variable in
 sysv startup script
In-Reply-To: <20200204012200.7273-5-bluemrp9@gmail.com> (Ryan Coe's message of
 "Mon, 3 Feb 2020 17:21:57 -0800")
References: <20200204012200.7273-1-bluemrp9@gmail.com>
 <20200204012200.7273-5-bluemrp9@gmail.com>
Message-ID: <871rralas2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com> writes:

 > This patch renames MYSQL_PID to MYSQL_PIDFILE in the startup script. This
 > is in anticipation for some upcoming changes.

 > Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
 > ---
 > Changes v2 -> v3:
 >   - separate changes into seperate patches (suggested by Thomas)
 > Changes v1 -> v2:
 >   - no change

Reworded slightly and applied, thanks.

-- 
Bye, Peter Korsgaard
