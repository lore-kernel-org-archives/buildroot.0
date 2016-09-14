From: Stewart Smith <stewart@linux.vnet.ibm.com>
Date: Thu, 15 Sep 2016 08:41:28 +1000
Subject: [Buildroot] [PATCH 0/1] [RFC] replace mysql with mariadb 10.0
In-Reply-To: <20160912220551.17934-1-bluemrp9@gmail.com>
References: <20160912220551.17934-1-bluemrp9@gmail.com>
Message-ID: <87lgyuw1d3.fsf@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan Coe <bluemrp9@gmail.com> writes:
> This patch represents my attempt to replace the aging mysql 5.1 that is
> currently shipped with Buildroot. I am replacing mysql altogether with mariadb
> version 10.0. I have been able to test this with both an arm and a x86_64
> build. I have not tested it with systemd. This patch is based on the work done
> by Sylvain Raybaud.

Would it be better to just add MariaDB rather than replace MySQL,
there's reasons to use one over the other.

-- 
Stewart Smith
OPAL Architect, IBM.
