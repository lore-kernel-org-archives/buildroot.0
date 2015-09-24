From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 24 Sep 2015 15:34:47 +0100
Subject: [Buildroot] [PATCH v12 1/1] squeezelite: new package
In-Reply-To: <56040873.30608@imgtec.com>
References: <201509241332.t8ODWvNZ013481@ms-omx03.plus.so-net.ne.jp>
 <56040873.30608@imgtec.com>
Message-ID: <56040A07.1070406@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hiroshi Kawashima,

On 09/24/2015 03:28 PM, Vicente Olivert Riera wrote:
[snip]
> Perhaps using $(TARGET_CONFIGURE_OPTS) as environment variable would
> work as well, and since it also defines PATH, then $(TARGET_MAKE_ENV)
> wouldn't be needed:
> 
> 	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
> 		OPTS="$(SQUEEZELITE_MAKE_OPTS)" -C $(@D) all

By the way this could be in one line, as it would have exactly 79
characters.

Regards,

Vincent.
