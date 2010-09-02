From: JNY <jny0@hotmail.com>
Date: Thu, 2 Sep 2010 04:50:51 -0700 (PDT)
Subject: [Buildroot] hwclock again
In-Reply-To: <AANLkTim5AseSa3e9zxb-7EfyLkNhfkDQNm0vX9GHqnHD@mail.gmail.com>
References: <29603222.post@talk.nabble.com>
	<AANLkTim5AseSa3e9zxb-7EfyLkNhfkDQNm0vX9GHqnHD@mail.gmail.com>
Message-ID: <29603393.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


just to check...
Do you have such a device (/dev/misc/rtc) in the target file system?

Regards,
Anders

-------------------

I have two targets target_skeleton, and target_busybox_skeleton (both
contained in target/generic), neither of which contain /dev/misc/rtc. 
However, neither contain ttyS0, and that ends up on the system when it's
loaded, and works.  What's going on?
-- 
View this message in context: http://old.nabble.com/hwclock-again-tp29603222p29603393.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
