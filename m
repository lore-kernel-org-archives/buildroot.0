From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 09:00:17 +0200
Subject: [Buildroot] [PATCH 2/2] package/oracle-mysql: don't use bundled
 zlib
In-Reply-To: <20200714163152.994504-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 14 Jul 2020 18:31:52 +0200")
References: <20200714163152.994504-1-fontaine.fabrice@gmail.com>
 <20200714163152.994504-2-fontaine.fabrice@gmail.com>
Message-ID: <875zagkpa6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > As spotted by Thomas Petazzoni during review of
 > https://patchwork.ozlabs.org/project/buildroot/patch/20200713215943.2240412-1-fontaine.fabrice at gmail.com,
 > oracle-mysql uses its bundled version of zlib if it is not found on the
 > system

 > So explictly disable zlib if needed and add a patch fixing build
 > failures without it

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
