From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Feb 2020 14:38:39 +0100
Subject: [Buildroot] [PATCH v3 2/8] package/mariadb: remove
 mariadb_config from target
In-Reply-To: <20200204012200.7273-2-bluemrp9@gmail.com> (Ryan Coe's message of
 "Mon, 3 Feb 2020 17:21:54 -0800")
References: <20200204012200.7273-1-bluemrp9@gmail.com>
 <20200204012200.7273-2-bluemrp9@gmail.com>
Message-ID: <87eevalbfk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com> writes:

 > We already remove mysql_config from the target since it's only useful in
 > staging. The same is true for mariadb_config. Thus, we remove it from the
 > target as well.

 > Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
 > ---
 > Changes v2 -> v3:
 >   - separate changes into seperate patches (suggested by Thomas)
 > Changes v1 -> v2:
 >   - no change

Committed, thanks.

-- 
Bye, Peter Korsgaard
