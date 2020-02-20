From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Feb 2020 08:03:11 +0100
Subject: [Buildroot] [PATCH v3 1/2] support/scripts/pkg-stats: add
 support for CVE reporting
In-Reply-To: <CAAXf6LWgtJ2LvtFArhbGk7Bg4__eqX1bC7At=VNYn=ROFP=GvA@mail.gmail.com>
 (Thomas De Schampheleire's message of "Thu, 20 Feb 2020 07:31:37
 +0100")
References: <20200215124417.236492-1-titouan.christophe@railnova.eu>
 <20200215124417.236492-2-titouan.christophe@railnova.eu>
 <20200219194858.11b317f6@windsurf>
 <CAAXf6LV8MSXPGrQW2GUhJcR4pjupw2EHFb7H6x4R0OkbrYFiMQ@mail.gmail.com>
 <87mu9ecldc.fsf@dell.be.48ers.dk>
 <CAAXf6LWgtJ2LvtFArhbGk7Bg4__eqX1bC7At=VNYn=ROFP=GvA@mail.gmail.com>
Message-ID: <875zg1d9lc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

Hi,

 >> Or perhaps something that doesn't load the entire json structure into
 >> memory? Jsonslicer seems like a possible solution:
 >> 
 >> https://pypi.org/project/jsonslicer/

 > Interesting, I hadn't seen it.
 > Note that we'll need to make the code py3-ready because jsonslicer is
 > python 3.4+ only.

Another option is ijson: https://pypi.org/project/ijson/

Which is available for both python 2.x and 3.x and is packaged in Debian
(and perhaps elsewhere).

-- 
Bye, Peter Korsgaard
