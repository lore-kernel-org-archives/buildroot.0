From: Dan Pattison <dan.pattison@ethertek.ca>
Date: Fri, 06 Feb 2009 07:21:29 -0800
Subject: [Buildroot] Urgent : at91rm9200 root file system
In-Reply-To: <1233928454.4559.27.camel@linux-l8en.site>
References: <498A1FA9.1070306@ethertek.ca>
	<878woldc0r.fsf@macbook.be.48ers.dk>	<1233814769.5851.73.camel@linux-l8en.site>	<87r62dauce.fsf@macbook.be.48ers.dk>	<1233920929.4559.12.camel@linux-l8en.site>	<87d4dvaij4.fsf@macbook.be.48ers.dk>	<1233924549.4559.17.camel@linux-l8en.site>	<87zlgz91gc.fsf@macbook.be.48ers.dk>
	<1233928454.4559.27.camel@linux-l8en.site>
Message-ID: <498C5579.10007@ethertek.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sandeep:

On the command line; navigate to the folder where you want your build 
environment installed.
Type out this command:   

svn co svn://uclibc.org/trunk/buildroot

It will download the current Buildroot files. Then type out:

make at91rm9200df_defconfig

Then type out:

make

Try that. Also the docs are here

http://buildroot.uclibc.org/buildroot.html

Best Regards,
Dan Pattison


Sandeep Kumar wrote:
> Hi Peter,
>
> Thanks once again for your response.
>
> Sorry!!!, I have not understood your reply. I am some what new to this
> platform. I am working on a linux machine and i do not have the source
> code for the root file system to make it. From where can i get the
> source code to build it for at91rm9200. Where should i execute the
> command sent by you (make at91rm9200df_defconfig; make) without having
> the source code. And if i am making some mistake can you please explain
> me in a little bit detail. I will be very thankful to you.
>
> Regards
> Sandeep
>
>
> On Fri, 2009-02-06 at 13:47 +0100, Peter Korsgaard wrote:
>   
>>>>>>> "Sandeep" == Sandeep Kumar <sandeepk@verismonetworks.com> writes:
>>>>>>>               
>>  Sandeep> Hi peter
>>  Sandeep> Thanks for reply.
>>
>>  Sandeep> For this I want the root file system source code which i
>>  Sandeep> dont have. from where can i get it.
>>
>> Buildroot will download the sources and build the rootfs for you when
>> you run make.
>>
>>     
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>   
> ------------------------------------------------------------------------
>
>
> No virus found in this incoming message.
> Checked by AVG - www.avg.com 
> Version: 8.0.233 / Virus Database: 270.10.18/1936 - Release Date: 01/29/09 17:57:00
>
>   
