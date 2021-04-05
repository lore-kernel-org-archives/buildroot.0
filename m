From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 05 Apr 2021 09:28:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-paramiko: drop
 python-pyasn1 dependency
In-Reply-To: <20210404211326.3443620-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 4 Apr 2021 23:13:26 +0200")
References: <20210404211326.3443620-1-fontaine.fabrice@gmail.com>
Message-ID: <878s5xw5pi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > python-pyasn1 is truly optional since version 2.5.0 and
 > https://github.com/paramiko/paramiko/commit/a31818c28556055341ae3d249e3893d40eb2b232

Good catch!

Committed, thanks.

-- 
Bye, Peter Korsgaard
