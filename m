From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Nov 2020 18:38:40 +0100
Subject: [Buildroot] curl: (7) Failed to connect to .... port 80:
 Connection refused
In-Reply-To: <AM0PR10MB24336FD9E371BA037F4DDCC982ED0@AM0PR10MB2433.EURPRD10.PROD.OUTLOOK.COM>
 (Kevin Tomary's message of "Fri, 6 Nov 2020 13:12:12 +0000")
References: <AM0PR10MB24336FD9E371BA037F4DDCC982ED0@AM0PR10MB2433.EURPRD10.PROD.OUTLOOK.COM>
Message-ID: <87tuu1xe1r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Kevin" == Kevin Tomary <kevin.tomary@hotmail.com> writes:

 > Hello
 > I am new to curl and a colleague created a rest point to see if my
 > STM32MP1 is communicating with it.

 > when I use
 > :~$ curl -i -k -X POST -H "Content-Type: application/json"
 > https://dv7knsjzph.execute-api.eu-central-1.amazonaws.com/prod/boxtronic-devices/1/data/

 > I get this:
 > curl: (7) Failed to connect to
 > dv7knsjzph.execute-api.eu-central-1.amazonaws.com port 80: Connection
 > refused

 > Does someone have a solution ?

Does it work with a http:// URL instead of https://? Does adding -v give
you any details about the failure?

What is your network setup? Can you ping amazonaws.com?

-- 
Bye, Peter Korsgaard
