import { Stack } from "@fluentui/react";
import {
    makeStyles,
    Body1,
    Caption1,
    Button,
  } from "@fluentui/react-components";
import { ArrowReplyRegular, ShareRegular } from "@fluentui/react-icons";  
import SingleContainerBox from "../components/SingleContainerBox";
import {
    Card,
    CardFooter,
    CardHeader,
    CardPreview,
    Text,
  } from "@fluentui/react-components";

const useStyles = makeStyles({
    card: {
      margin: "auto",
      width: "350px",
      maxWidth: "100%",
      paddingLeft: "40px"
    },
  });

const Health = () => {
    const styles = useStyles();
    return (

        <Stack horizontalAlign="start" grow={1}>
            <Stack.Item align="start" grow={3}>
                <Stack horizontal>
                <Card className={styles.card}>
                    <CardHeader
                        image={
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
                            <path d="M6 3C4.34315 3 3 4.34315 3 6V14C3 15.6569 4.34315 17 6 17H14C15.6569 17 17 15.6569 17 14V6C17 4.34315 15.6569 3 14 3H6ZM4 14V8H16V14C16 15.1046 15.1046 16 14 16H6C4.89543 16 4 15.1046 4 14ZM16 7H4V6C4 4.89543 4.89543 4 6 4H14C15.1046 4 16 4.89543 16 6V7ZM6.75 6.25C7.16421 6.25 7.5 5.91421 7.5 5.5C7.5 5.08579 7.16421 4.75 6.75 4.75C6.33579 4.75 6 5.08579 6 5.5C6 5.91421 6.33579 6.25 6.75 6.25ZM13.25 6.25C13.6642 6.25 14 5.91421 14 5.5C14 5.08579 13.6642 4.75 13.25 4.75C12.8358 4.75 12.5 5.08579 12.5 5.5C12.5 5.91421 12.8358 6.25 13.25 6.25ZM10.75 5.5C10.75 5.91421 10.4142 6.25 10 6.25C9.58579 6.25 9.25 5.91421 9.25 5.5C9.25 5.08579 9.58579 4.75 10 4.75C10.4142 4.75 10.75 5.08579 10.75 5.5ZM6 9C5.44772 9 5 9.44771 5 10V14C5 14.5523 5.44772 15 6 15H14C14.5523 15 15 14.5523 15 14V10C15 9.44772 14.5523 9 14 9H6ZM6 14V10H14V14H6Z" fill="#242424"/>
                            </svg>
                        }
                        header={
                        <Body1>
                            Oven Health - Zone 4
                        </Body1>
                        }
                        description={<Caption1> </Caption1>}
                    />

                    <CardPreview>
                        <Text>5,050</Text>
                    </CardPreview>

                    <CardFooter>
                    <Text>Shoppers per day</Text>
                    <Text>Customers per week</Text>                        
                    </CardFooter>
                </Card>                        
                <Stack>
                        <SingleContainerBox />
                </Stack>                     
                <Stack>
                        <SingleContainerBox />
                </Stack>                     
                </Stack> 
            </Stack.Item>
        </Stack>
    );
  };
  
  export default Health;