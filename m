From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Nov 2019 19:54:50 +0100
Subject: [Buildroot] [PATCH 2/2] board/stm32mp157c-dk2: remove
 unnecessary workaround
In-Reply-To: <20191103115017.788940-2-b.bilas@grinn-global.com> (Bartosz
 Bilas's message of "Sun, 3 Nov 2019 12:50:17 +0100")
References: <20191103115017.788940-1-b.bilas@grinn-global.com>
 <20191103115017.788940-2-b.bilas@grinn-global.com>
Message-ID: <87o8xsg58l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bartosz" == Bartosz Bilas <b.bilas@grinn-global.com> writes:

 > Since we know the proper solution, remove that faulty patch.

Ehh, can you be a bit more specific? Do you mean that the change of
ext4fs parameters fix the issue that this is trying to work around?

-- 
Bye, Peter Korsgaard
