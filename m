From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Dec 2018 23:41:26 +0100
Subject: [Buildroot] [PATCH 1/1] apache: enable support for nghttp2
In-Reply-To: <20181230164644.353139af@windsurf> (Thomas Petazzoni's message of
 "Sun, 30 Dec 2018 16:46:44 +0100")
References: <20181229013909.2439-1-bluemrp9@gmail.com>
 <20181230164644.353139af@windsurf>
Message-ID: <87y386skmh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > (Also a question for Bernd below)

 > On Fri, 28 Dec 2018 17:39:09 -0800, Ryan Coe wrote:
 >> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
 >> ---
 >> package/apache/apache.mk | 9 +++++++++
 >> 1 file changed, 9 insertions(+)

 > Applied to master, thanks. I just noticed that Apache modules are
 > installed in $(TARGET_DIR)/usr/modules/. It's not a really great path,
 > as it's not apache specific. Can we make this
 > $(TARGET_DIR)/usr/lib/apache/modules/ or something like that ?

FYI, Debian installs into /usr/lib/apache2/modules/ (but that is
presumably for legacy reasons with apache 1.x).

-- 
Bye, Peter Korsgaard
