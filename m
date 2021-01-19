From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2021 20:26:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/xenomai: drop unrecognized
 option
In-Reply-To: <20210119173208.436382-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 19 Jan 2021 18:32:08 +0100")
References: <20210119173208.436382-1-fontaine.fabrice@gmail.com>
Message-ID: <877do8buen.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > --disable-doc-install is not available since version 3.0.6 and
 > https://gitlab.denx.de/Xenomai/xenomai/-/commit/6076f0951c7c37917c625b1aa1cd6905c27310f6

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Custom versions could conceptually still require this, but given that it
was dropped more than 3 years ago we are probably OK.

Committed, thanks.

-- 
Bye, Peter Korsgaard
