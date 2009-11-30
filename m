From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 30 Nov 2009 09:08:29 +0100
Subject: [Buildroot] [PATCH] gcc: Add option to build final-gcc with
	sysroot option
In-Reply-To: <4B1374D2.9090701@st.com> (Carmelo AMOROSO's message of "Mon\,
	30 Nov 2009 08\:31\:30 +0100")
References: <1258969104-4217-1-git-send-email-carmelo.amoroso@st.com>
	<87ws1c58dl.fsf@macbook.be.48ers.dk> <4B0FEA2F.9080508@st.com>
	<878wdq4c1u.fsf@macbook.be.48ers.dk> <4B1374D2.9090701@st.com>
Message-ID: <87zl64zb7m.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carmelo" == Carmelo AMOROSO <carmelo.amoroso@st.com> writes:

Hi,

 Carmelo> please read the message
 Carmelo> http://lists.uclibc.org/pipermail/uclibc/2009-November/043303.html
 Carmelo> I've already noted this, so for gcc 4.x.y it is not required,
 Carmelo> but it should be applied for gcc 3.x.y. What do you think ?

But isn't sysroot a gcc >= 4.1.x feature? Do old gcc's even understand
--with-sysroot ?

-- 
Bye, Peter Korsgaard
