From: Alan Ott <alan@signal11.us>
Date: Wed, 19 Mar 2014 22:07:25 -0400
Subject: [Buildroot] [PATCH] manual: Add Section on using Buildroot's
 Toolchain Externally
In-Reply-To: <20140320025844.12fa4f78@skate>
References: <1395273466-19365-1-git-send-email-alan@signal11.us>
 <20140320025844.12fa4f78@skate>
Message-ID: <532A4D5D.9090600@signal11.us>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/19/2014 09:58 PM, Thomas Petazzoni wrote:
> Dear Alan Ott,
>
> On Wed, 19 Mar 2014 19:57:46 -0400, Alan Ott wrote:
>> Signed-off-by: Alan Ott <alan@signal11.us>
>> ---
>>   docs/manual/customize-toolchain.txt | 30 ++++++++++++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
>> diff --git a/docs/manual/customize-toolchain.txt b/docs/manual/customize-toolchain.txt
>> index 31c9140..71687d3 100644
>> --- a/docs/manual/customize-toolchain.txt
>> +++ b/docs/manual/customize-toolchain.txt
>> @@ -49,3 +49,33 @@ It allows to tune major settings, such as:
>>   
>>   These settings are available after selecting the +Buildroot toolchain+ type in
>>   the menu +Toolchain+.
>> +
>> +Using a Buildroot Toolchain from Outside Buildroot
>> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Thanks a lot for this contribution. However, the manual already has a
> section about this topic, see:
>
>    http://buildroot.org/downloads/manual/manual.html#_using_the_generated_toolchain_outside_buildroot

Oh no! So it does.

I was talking with Yann about this on the IRC earlier, and he suggested 
I add it to the manual. I should have looked a bit closer.
Or maybe I misunderstood, and maybe he meant I should extend the part 
that was already there to add what we talked about on the IRC (wrapper, 
etc).

> Maybe it should be extended to contain more details, but at least it
> would be nice to not duplicate the information in the manual.

What's there is pretty good. I wish I had found it before I had the 
problems I was having (which ultimately stemmed from not using --sysroot).

Thanks for all you do for buildroot. It's a great tool. Sorry for the 
noise....

Alan.
