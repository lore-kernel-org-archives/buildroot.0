From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 19 Jul 2013 16:52:15 +0200
Subject: [Buildroot] [PATCH] dhcp: add config option for delayed-ack
 feature of dhcp server
In-Reply-To: <51E9427D.4070607@zacarias.com.ar>
References: <2ac4c1f0c7025c5012b9.1374237997@BEANTN0L019720>
 <51E93C09.2090906@zacarias.com.ar>
 <CAAXf6LWbC+GDgjnw3tfE-yuw6u6V0btBOKY1wtenbp_zMGP-Qw@mail.gmail.com>
 <51E9427D.4070607@zacarias.com.ar>
Message-ID: <CAAXf6LX=+fhMu0XN9U7vyf-_Qnnj+cSfi-gduHysN9OKQtFz-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 19, 2013 at 3:43 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> On 07/19/2013 10:32 AM, Thomas De Schampheleire wrote:
>
>> but in the meantime we're several releases further. I don't know if it
>> is still accurate.
>>
>> I think you're right that it's not default-on in dhcpd.conf.
>>
>> What do you say, enable it always at compile time?
>
> Oh yes it's a default, so let's just keep the option.
> (includes/dhcpd.h -> DEFAULT_DELAYED_ACK)

You're right, so we have to keep the option.
Hence, the patch remains as it is.

Thanks for your feedback,
Thomas
