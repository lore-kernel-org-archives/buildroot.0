From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2019 17:35:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/collectd: rename --with-yajl
In-Reply-To: <20191110205316.1713-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 10 Nov 2019 21:53:16 +0100")
References: <20191110205316.1713-1-fontaine.fabrice@gmail.com>
Message-ID: <87a78ggdrq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > --with-yajl is not recognized so replace it by the correct
 > --with-libyajl option

 > The option is named --with-libyajl since a very long time (since at
 > least version 4.8.0 and
 > https://github.com/collectd/collectd/commit/f154fb21fbb1fee2f2262d421eca32e7e340f420)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
