From: Sam Voss <samuel.voss@rockwellcollins.com>
Date: Fri, 19 May 2017 10:40:19 -0500
Subject: [Buildroot] [PATCH v2 1/2] package/avrdude: add linux gpio
	kconfig option
In-Reply-To: <CANQCQpZ_2FD3KG5oH=U=fc3nZExhmKCaFcpHTx2Ykx2XcyXSSg@mail.gmail.com>
References: <1495120094-44581-1-git-send-email-matthew.weber@rockwellcollins.com>
 <87r2zl2dls.fsf@dell.be.48ers.dk>
 <CANQCQpagwa4KgHS0gw-YL_U2-KUV5_tuFM5a0gqt_1TahN6Vjw@mail.gmail.com>
 <8760gw3ntd.fsf@dell.be.48ers.dk>
 <CANQCQpZ_2FD3KG5oH=U=fc3nZExhmKCaFcpHTx2Ykx2XcyXSSg@mail.gmail.com>
Message-ID: <CAH=K+6nK0gqwcNY2cNE6Lo3dOt6qMOjY5LZcVq_gQ4RhaXx=Hw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> I notice that we are using a fork of avrdude which hasn't really been
>> updated significantly since 2013 instead of the official one which had a
>> release in 2016. Any reason we shouldn't be using the official one
>> instead?
>
> Very good question, we are unsure.  I've added a few people that have
> modified that package to this email to ask.
>
> Wojciech / Samuel / Gregory,  any reason to stay on this fork of avrdude?

The biggest reason is due to the fact that the spi functionality has
not been merged back into mainline, and requests to do it have fallen
onto deaf ears. I sent an email recently to the mainline avrdude
asking about getting this functionality merged in and have yet to hear
anything from them.

-- 
Sam Voss
