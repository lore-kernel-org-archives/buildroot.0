From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 17:51:32 +0200
Subject: [Buildroot] [PATCH 1/2] configs/stm32f429: force usage of
 BINUTILS 2.28.x
In-Reply-To: <1527595765-23055-1-git-send-email-christophe.priouzeau@st.com>
 (Christophe PRIOUZEAU's message of "Tue, 29 May 2018 12:09:27 +0000")
References: <1527595765-23055-1-git-send-email-christophe.priouzeau@st.com>
Message-ID: <87y3g25ukb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christophe" == Christophe PRIOUZEAU <christophe.priouzeau@st.com> writes:

 > Due to runtime issue with the usage of BINUTILS 2.29.x,
 > we need to use the version 2.28.x

 > Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>

Committed both after adding a reference to the bugtracker issue, thanks.

-- 
Bye, Peter Korsgaard
