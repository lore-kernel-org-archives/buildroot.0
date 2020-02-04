From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Feb 2020 14:54:34 +0100
Subject: [Buildroot] [PATCH v3 6/8] package/mariadb: explicitly define
 logging directory to mysqld
In-Reply-To: <20200204012200.7273-6-bluemrp9@gmail.com> (Ryan Coe's message of
 "Mon, 3 Feb 2020 17:21:58 -0800")
References: <20200204012200.7273-1-bluemrp9@gmail.com>
 <20200204012200.7273-6-bluemrp9@gmail.com>
Message-ID: <87wo92jw4l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com> writes:

 > By default, mariadb creates logging files under the data directory.
 > This patch updates the startup scripts to log under /var/log/mysql.

 > Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
 > ---
 > Changes v2 -> v3:
 >   - separate changes into seperate patches (suggested by Thomas)
 > Changes v1 -> v2:
 >   - no change

Committed, thanks.

-- 
Bye, Peter Korsgaard
