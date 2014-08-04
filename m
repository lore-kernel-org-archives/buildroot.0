From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 4 Aug 2014 07:05:50 +0200
Subject: [Buildroot] [PATCH v2] nginx: new package
In-Reply-To: <53DEEC48.3060404@zacarias.com.ar>
References: <1407102155-2615-1-git-send-email-s.martin49@gmail.com>
 <53DEEC48.3060404@zacarias.com.ar>
Message-ID: <CAHXCMM+dnpUSKV-GO1CU2AhPMccCmdgL5x2JCdoxG9gdhxFG6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo, all,

On Mon, Aug 4, 2014 at 4:13 AM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> On 08/03/2014 06:42 PM, Samuel Martin wrote:
>
>> +################################################################################
>> +#
>> +# nginx
>> +#
>> +################################################################################
>> +
>> +NGINX_VERSION = 1.7.3
>
> Hi Samuel, nice work.
> Any particular reason to go latest mainline instead of latest stable?
> From a security point of view it'll probably be harder to track down
> future discoveries/fixes.

None, just the habit to use the latest release ;-)
I can easily rollback to the 1.6.0 version.

> Thanks!
> Regards.
>

Cheers,

-- 
Samuel
