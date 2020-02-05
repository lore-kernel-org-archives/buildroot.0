From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 05 Feb 2020 15:28:05 +0100
Subject: [Buildroot] [PATCH v2] packagersyslog: enable options when
 libcurl is enabled
In-Reply-To: <CANQCQpaJmxptbNBoOuD9tyfL9rh_Y9d_6HOtwjVuqw2wxpcPgg@mail.gmail.com>
 (Matthew Weber's message of "Wed, 5 Feb 2020 07:56:23 -0600")
References: <20191104211203.52912-1-matthew.weber@rockwellcollins.com>
 <87a761ni4l.fsf@dell.be.48ers.dk>
 <CANQCQpYkxiByUsrfQbDHDd0WpAsTeiggJXJpJqNp6_N=M1ud5A@mail.gmail.com>
 <CANQCQpaJmxptbNBoOuD9tyfL9rh_Y9d_6HOtwjVuqw2wxpcPgg@mail.gmail.com>
Message-ID: <871rr9w1l6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

Hi,

 >> > Alternatively, you may set the environment variables LIBLOGNORM_CFLAGS
 >> > and LIBLOGNORM_LIBS to avoid the need to call pkg-config.
 >> > See the pkg-config man page for more details.
 >> > make[1]: *** [package/pkg-generic.mk:250:
 >> > /home/peko/source/buildroot/output-rsyslog/build/rsyslog-8.1911.0/.stamp_configured]
 >> > Error 1
 >> >
 >> > Care to take a look?

 > Looking at this I think I'd like to reject my patch for now.  I think
 > we need a specific use case to test this out and justify why libcurl
 > options should be enabled.  I had just sent the patch to round out the
 > previous bump that had disabled libcurl related items.

Ok, I will update the status in patchwork then.

-- 
Bye, Peter Korsgaard
