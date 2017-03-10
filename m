From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 10 Mar 2017 12:15:18 -0600
Subject: [Buildroot] [PATCH 1/1] python: disable _ssl.c build when
	--disable-ssl
In-Reply-To: <20170310000437.5513602a@free-electrons.com>
References: <1484169742-28866-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20170310000437.5513602a@free-electrons.com>
Message-ID: <CANQCQpa1Lp8hqpmaZREEoYbJEusrAerNQriQ_H4+ENped3DVAA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam


On Mar 9, 2017 5:04 PM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:

Hello,

On Wed, 11 Jan 2017 15:22:22 -0600, Matt Weber wrote:
> From: Adam <adam.allison@rockwellcollins.com>
>
> When --disable-ssl is provided as an option,
> prevent the building of _ssl.c.
> Without this change, some GCC toolchains fail
> to build the _ssl module depending on the
> build configuration
> (we observed 4.85 worked and 4.9.4).
>
> Signed-off-by: Adam Allison <adam.allison@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

Thanks for this patch. However I fixed it in a different/simpler way in
commit
https://git.buildroot.org/buildroot/commit/package/python?id=
3c98442669f173818a8cce9479ebb0806cb9f8a2

Let me know if that works for you.


  Adam, do you have a test you could run?  It looks fine to me but I can't
test.


Best regards,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170310/9309ed6b/attachment.html>
