From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 9 Jul 2019 19:14:19 +0200
Subject: [Buildroot] [RFC] BR2_EXTERNAL linux-kernel-extensions support
In-Reply-To: <CANQCQpbobC6KV9fNwUw3gzUonzsW+W5E9EjYNnMmmoJ9bVRQHA@mail.gmail.com>
References: <20190709005820.595-1-robert.mccabe@rockwellcollins.com>
 <CANQCQpbobC6KV9fNwUw3gzUonzsW+W5E9EjYNnMmmoJ9bVRQHA@mail.gmail.com>
Message-ID: <54114ab5-43aa-a55c-6402-9f1a5d614400@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/07/2019 04:15, Matthew Weber wrote:
> Hi Rob,
> 
> On Mon, Jul 8, 2019 at 7:58 PM <robert.mccabe@rockwellcollins.com> wrote:
>>
>> From: "McCabe, Robert J" <robert.mccabe@rockwellcollins.com>
>>
>> Allows external projects to inject custom code inside the Linux source
>> tree.
>>
>> Although a simple change that *shouldn't* be controversial I'm troubled
>> by the comment a few lines above:
>>
>>    #However, since the files we include here are in the same directory as
>>    #the current Makefile, we are OK. But this is a hard requirement: files
>>    #included here *must* be in the same directory!
>>
>> I'm not seeing why this is a "hard requirement" ...
> 
> There was some discussion on a similar thread earlier this year. (I
> added Ryan Barnett as we had similar interest in converting our
> internal linux extension over to the upstream approach.)
> http://buildroot-busybox.2317881.n4.nabble.com/Linux-extension-from-a-BR2-EXTERNAL-tree-td214834.html#a214845

 Thomas's approach in that thread, however, was to include the extension *after*
linux.mk expansion. This doesn't work, as explained in that thread.


 Regards,
 Arnout

[snip]
