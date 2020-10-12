From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Oct 2020 10:15:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/mongodb: security bump to
 version 4.2.10
In-Reply-To: <20201011193551.1916306-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 11 Oct 2020 21:35:51 +0200")
References: <20201011193551.1916306-1-fontaine.fabrice@gmail.com>
Message-ID: <87362juag6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > SERVER-50463 Make PooledLDAPConnection::refresh take self-ownership
 > https://docs.mongodb.com/manual/release-notes/4.2-changelog/#id1

Committed to 2020.05.x and 2020.08.x, thanks.

2020.02.x uses mongodb 4.0.x, which does not have a fix yet.

-- 
Bye, Peter Korsgaard
