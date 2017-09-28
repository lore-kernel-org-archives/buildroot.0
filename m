From: Erik Stromdahl <erik.stromdahl@gmail.com>
Date: Thu, 28 Sep 2017 20:21:32 +0200
Subject: [Buildroot] [PATCH v2 1/4] board/raspberrypi/post-image.sh: add
 multi arg support
In-Reply-To: <8b056f3f-7ff1-191c-e0e7-bce66e7af9ef@mind.be>
References: <1500123032-9198-1-git-send-email-erik.stromdahl@gmail.com>
 <8b056f3f-7ff1-191c-e0e7-bce66e7af9ef@mind.be>
Message-ID: <e2ee10c1-2daf-2405-d8f2-a19bff923ca9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 2017-09-27 22:13, Arnout Vandecappelle wrote:
> 
> 
> On 15-07-17 14:50, Erik Stromdahl wrote:
>> Add possibility to supply multiple arguments to
>> post-image.sh
>>
>> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> 
>   Applied to master, thanks, with one little change...
> 
> [snip]
>> -	fi
>> -	;;
>> +		fi
>> +		;;
>>   esac
> 
>   I indented the esac.
> 
Ah, perfect!

>   Regards,
>   Arnout
> 
>>   
>> +done
>> +
>>   rm -rf "${GENIMAGE_TMP}"
>>   
>>   genimage                           \
>>
> 
