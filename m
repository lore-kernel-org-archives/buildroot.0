From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 17 Sep 2015 16:21:44 -0300 (BRT)
Subject: [Buildroot] [PATCH V4 1/1] gmock: new package
In-Reply-To: <55BB80D3.1090209@openwide.fr>
References: <1431713119-2821-1-git-send-email-casantos@datacom.ind.br>
 <1438343622-6128-1-git-send-email-casantos@datacom.ind.br>
 <55BB80D3.1090209@openwide.fr>
Message-ID: <1576236607.15822847.1442517704482.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Gentle reminder: this change still needs to be applied:

    http://patchwork.ozlabs.org/patch/502506/

Carlos Santos (Casantos)
DATACOM, P&D

----- Original Message -----
> From: "Romain Naour" <romain.naour@openwide.fr>
> To: "Carlos Santos" <casantos@datacom.ind.br>, buildroot at buildroot.org
> Sent: Friday, July 31, 2015 11:06:11 AM
> Subject: Re: [Buildroot] [PATCH V4 1/1] gmock: new package

> Hi Carlos,
> 
> Le 31/07/2015 13:53, Carlos Santos a ?crit :
>> Inspired by jMock, EasyMock, and Hamcrest, and designed with C++'s
>> specifics in mind, Google C++ Mocking Framework (or Google Mock for
>> short) is a library for writing and using C++ mock classes.
>> 
>> Google Mock:
>> 
>>   * lets you create mock classes trivially using simple macros,
>>   * supports a rich set of matchers and actions,
>>   * handles unordered, partially ordered, or completely ordered
>>     expectations,
>>   * is extensible by users, and
>>   * works on Linux, Mac OS X, Windows, Windows Mobile, minGW, and
>>     Symbian.
>> 
>>   http://code.google.com/p/googlemock/
>> 
>> There are both host and target packages. The target one has include
>> files required to compile the tests and the static libraries required
>> to link/run them. The host package installs gmock_gen, a Python script
>> used to generate code mocks.
>> 
>> Notice that GMock 1.7.0 requires the Python 2 host package even if
>> Python 3 is selected as a target package.
>> 
>> Signed-off-by: Marcelo Barbosa <marcelo.barbosa@datacom.ind.br>
>> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> 
> Reviewed-by: Romain Naour <romain.naour@openwide.fr>
> 
> Best regards,
> Romain Naour
