From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 25 Feb 2014 06:50:12 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-02-23
In-Reply-To: <530B9A88.9010402@mind.be>
References: <20140224073008.3ECD8100F60@stock.ovh.net>
 <CAAXf6LVNCe6OeGpe8sngvwErdQPgfbFfHg8f2mxmZBPqajL8AQ@mail.gmail.com>
 <877g8kn6qf.fsf@dell.be.48ers.dk>
 <CAAXf6LX0eoYHR7PUb8MvZdJFiQN29Tt8CBf8iFqY8wFa3FFetw@mail.gmail.com>
 <530B9A88.9010402@mind.be>
Message-ID: <a278b312-d64e-47dd-9822-2e9d7a79e379@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle <arnout@mind.be> schreef:
>On 24/02/14 12:37, Thomas De Schampheleire wrote:
>> On Mon, Feb 24, 2014 at 11:30 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>>>
>>>
>>>  >> tvheadend-c7d0335eb10d02b78... | 1
>>>
>>>  > Too old kernel headers (SYS_TURBO), patch available:
>>>  > http://patchwork.ozlabs.org/patch/323403/
>>>
>>> Yes, but that relies on the TOOLCHAIN_HEADERS_AT_LEAST_x stuff. Do we
>>> want that for 2014.02?
>> 
>> It may be very short before the deadline for a patch series like this,
>> but if you ask me, I would dare to apply it still.
>
> I disagree. Even though the patch series just touches Config.in so is
>less risky, I think it's a bad idea to still apply it to master now. I
>wouldn't like to have to release a 2014.02.1 again...
>
> Also note that this is not a regression - we've lived with the
>incompatible kernel headers situation for years. I think that not fixing
>this behaviour in 2014.02 is less bad than running the risk of breaking
>something that works.

You're all a bunch of chickens!

;)
